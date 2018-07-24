import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import SwipeableViews from 'react-swipeable-views';
import { withStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';
import Zoom from '@material-ui/core/Zoom';
import Button from '@material-ui/core/Button';
import AddIcon from '@material-ui/icons/Add';
import EditIcon from '@material-ui/icons/ModeEdit';
import UpIcon from '@material-ui/icons/KeyboardArrowUp';
import green from '@material-ui/core/colors/green';
import FormControl from '@material-ui/core/FormControl';
import FormHelperText from '@material-ui/core/FormHelperText';
import NativeSelect from '@material-ui/core/NativeSelect';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';

function TabContainer(props) {
  const { children, dir } = props;

  return (
    <Typography component="div" dir={dir} style={{ padding: 8 * 3 }}>
      {children}
    </Typography>
  );
}

TabContainer.propTypes = {
  children: PropTypes.node.isRequired,
  dir: PropTypes.string.isRequired,
};

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.background.paper,
    position: 'relative',
  },
  fab: {
    position: 'absolute',
    bottom: theme.spacing.unit * 2,
    right: theme.spacing.unit * 2,
  },
  fabGreen: {
    color: theme.palette.common.white,
    backgroundColor: green[500],
  },
  formControl: {
    width: '100%'
  }
});

const options = ['device_off', 'low_heat', 'high_heat']

class FloatingActionButtonZoom extends React.Component {
  state = {
    value: 0,
  };

  static getDerivedStateFromProps = (props, state) => {
    return { value: props.selected }
  }

  handleChange = (event, value) => {
    const { onClick } = this.props

    this.setState({ value });

    onClick(options[value])
  };

  handleChangeIndex = value => {
    const { onClick } = this.props

    this.setState({ value });

    onClick(options[value])
  };

  render() {
    const { classes, theme } = this.props;
    const transitionDuration = {
      enter: theme.transitions.duration.enteringScreen,
      exit: theme.transitions.duration.leavingScreen,
    };

    return (
      <div className={classes.root}>
        <AppBar position="static" color="default">
          <Tabs
            value={this.state.value}
            onChange={this.handleChange}
            indicatorColor="primary"
            textColor="primary"
            fullWidth
          >
            <Tab label="Off" />
            <Tab label="40°C" />
            <Tab label="50°C" />
          </Tabs>
        </AppBar>
        {
          false &&
          <SwipeableViews
            axis={theme.direction === 'rtl' ? 'x-reverse' : 'x'}
            index={this.state.value}
            onChangeIndex={this.handleChangeIndex}
          >
            <TabContainer dir={theme.direction}></TabContainer>
            <TabContainer dir={theme.direction}>
              { false &&

              <FormControl className={classes.formControl}>
                <InputLabel htmlFor="age-native-helper">Auto turn off</InputLabel>
                <NativeSelect
                  input={<Input name="age" id="age-native-helper" />}
                >
                  <option value={10}>in 10 minutes</option>
                  <option value={15}>in 15 minutes</option>
                  <option value={20}>in 20 minutes</option>
                  <option value={30}>in 30 minutes</option>
                  <option value={60}>in 1 hour</option>
                  <option value={120}>in 2 hours</option>
                </NativeSelect>
                <FormHelperText>after reaching goal tempearture</FormHelperText>
              </FormControl>
              }
            </TabContainer>
            <TabContainer dir={theme.direction}>
              { false &&

              <FormControl className={classes.formControl}>
                <InputLabel htmlFor="age-native-helper">Auto turn off</InputLabel>
                <NativeSelect
                  input={<Input name="age" id="age-native-helper" />}
                >
                  <option value={10}>in 10 minutes</option>
                  <option value={15}>in 15 minutes</option>
                  <option value={20}>in 20 minutes</option>
                  <option value={30}>in 30 minutes</option>
                  <option value={60}>in 1 hour</option>
                  <option value={120}>in 2 hours</option>
                </NativeSelect>
                <FormHelperText>after reaching goal tempearture</FormHelperText>
              </FormControl>
              }
            </TabContainer>
          </SwipeableViews>
        }
      </div>
    );
  }
}

FloatingActionButtonZoom.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired,
};

export default withStyles(styles, { withTheme: true })(FloatingActionButtonZoom);
