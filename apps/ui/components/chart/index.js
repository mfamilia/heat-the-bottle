import ChartistGraph from 'react-chartist'
import { temperatureChart } from '../../charts'

const Chart = ({ temperatures }) => {
  if (!temperatures) { return null }

  const chart = temperatureChart(temperatures)

  return (
    <ChartistGraph
      className='ct-chart'
      data={chart.data}
      type='Line'
      options={chart.options}
      listener={chart.animation}
    />
  )
}

export default Chart
