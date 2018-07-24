/* eslint-disable jsx-a11y/anchor-is-valid */
import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import AccessTime from '@material-ui/icons/AccessTime'
import { withStyles } from '@material-ui/core/styles'
import Link from 'next/link'
import dynamic from 'next/dynamic'
import { Socket } from 'phoenix-channels'
import moment from 'moment'

import Card from '../components/card'
import CardHeader from '../components/card/header'
import CardIcon from '../components/card/icon'
import CardBody from '../components/card/body'
import CardFooter from '../components/card/footer'
import Button from '../components/button'
import Button2 from '../components/button2'
import '../style.css'
import style from './style'


const Chart = dynamic(import('../components/chart'))

class Index extends React.Component {
  constructor(props) {
    super(props)

    this.state = {}
    this.handleClick = this.handleClick.bind(this)
  }

  componentDidMount() {
    const socket = new Socket("ws://nerves.local/socket")

    socket.connect()

    const channel = socket.channel("room:lobby", {})

    channel.onError(() => {
      this.setState({
        connected: false,
        updated: null
      })
    })

    channel.on("latest_temperatures", ({ temperatures, mode }) => {
      this.setState({
        connected: true,
        temperatures,
        updated: moment(),
        mode
      })
    })

    channel.on("temperature_update", payload => {
      const { temperatures } = this.state
      temperatures.unshift(payload)

      this.setState({
        connected: true,
        temperatures,
        updated: moment()
      })
    })

    channel.on("device:off", payload => {
      this.setState({
        mode: 0,
        updated: moment()
      })
    })

    channel.on("heat:low", payload => {
      this.setState({
        mode: 1,
        updated: moment()
      })
    })

    channel.on("heat:high", payload => {
      this.setState({
        mode: 2,
        updated: moment()
      })
    })

    channel.join()
      .receive("ok", resp => { this.setState({ connected: true })})
      .receive("error", resp => { this.setState({ connected: false })})

    this.setState({ channel })
  }

  handleClick(option) {
    const { channel } = this.state

    channel.push(option, {})
  }

  updateStatement() {
    const { updated } = this.state

    if (!updated) {
      return 'pending...'
    }

    const diff = moment().diff(moment(updated))

    return diff ?
      `updated ${diff} ${diff > 1 ? 'minutes' : 'minute'} ago` :
      'updated just now'

  }

  render() {
    const { classes } = this.props
    const { temperatures, connected, mode } = this.state
    const color = connected ? 'primary' : ''

    return (
      <div className={classes.root}>
        <Typography variant='display1'>
          Warmer Control
        </Typography>
        <Card chart>
          <CardHeader color={color}>
            <Chart temperatures={temperatures} />
          </CardHeader>
          <CardBody>
            <h4 className={classes.cardTitle}>Temperature Control</h4>
            <p className={classes.cardCategory}>
              <Button
                selected={mode}
                onClick={this.handleClick}
              />
            </p>
          </CardBody>
          <CardFooter chart>
            <div className={classes.stats}>
              <AccessTime />
              {
                this.updateStatement()
              }
            </div>
          </CardFooter>
        </Card>
        { false &&

        <Card chart>
          <CardHeader color='success'>
            <Chart />
          </CardHeader>
          <CardBody>
            <h4 className={classes.cardTitle}>Schedule Control</h4>
            <p className={classes.cardCategory}>
              <Button2 />
            </p>
          </CardBody>
        </Card>
        }
      </div>
    )
  }
}

Index.propTypes = {
  classes: PropTypes.object.isRequired,
}

export default withStyles(style)(Index)
