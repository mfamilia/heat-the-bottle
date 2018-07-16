/* eslint-disable jsx-a11y/anchor-is-valid */
import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import AccessTime from '@material-ui/icons/AccessTime'
import { withStyles } from '@material-ui/core/styles'
import Link from 'next/link'
import dynamic from 'next/dynamic'

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
  render() {
    const { classes } = this.props

    return (
      <div className={classes.root}>
        <Typography variant='display1'>
          Warmer Control
        </Typography>
        <Card chart>
          <CardHeader color='info'>
            <Chart />
          </CardHeader>
          <CardBody>
            <h4 className={classes.cardTitle}>Temperature Control</h4>
            <p className={classes.cardCategory}>
              <Button />
            </p>
          </CardBody>
          <CardFooter chart>
            <div className={classes.stats}>
              <AccessTime /> updated 4 minutes ago
            </div>
          </CardFooter>
        </Card>
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
      </div>
    )
  }
}

Index.propTypes = {
  classes: PropTypes.object.isRequired,
}

export default withStyles(style)(Index)
