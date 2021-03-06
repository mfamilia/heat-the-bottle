import {
  warningCardHeader,
  successCardHeader,
  dangerCardHeader,
  infoCardHeader,
  primaryCardHeader,
  roseCardHeader
} from '../../../style.js'

const style = {
  cardIcon: {
    '&$warningCardHeader,&$successCardHeader,&$dangerCardHeader,&$infoCardHeader,&$primaryCardHeader,&$roseCardHeader': {
      borderRadius: '3px',
      backgroundColor: '#999',
      padding: '15px',
      marginTop: '-20px',
      marginRight: '15px',
      float: 'left'
    }
  },
  warningCardHeader,
  successCardHeader,
  dangerCardHeader,
  infoCardHeader,
  primaryCardHeader,
  roseCardHeader
}

export default style
