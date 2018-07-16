import ChartistGraph from 'react-chartist'
import { dailySalesChart } from '../../charts'

const Chart = () => {
  return (
    <ChartistGraph
      className='ct-chart'
      data={dailySalesChart.data}
      type='Line'
      options={dailySalesChart.options}
      listener={dailySalesChart.animation}
    />
  )
}

export default Chart
