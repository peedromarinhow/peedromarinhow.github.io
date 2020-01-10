/*const colors = [{"r":7,"g":7,"b":7},{"r":31,"g":7,"b":7},{"r":47,"g":15,"b":7},{"r":71,"g":15,"b":7},{"r":87,"g":23,"b":7},{"r":103,"g":31,"b":7},{"r":119,"g":31,"b":7},{"r":143,"g":39,"b":7},{"r":159,"g":47,"b":7},{"r":175,"g":63,"b":7},{"r":191,"g":71,"b":7},{"r":199,"g":71,"b":7},{"r":223,"g":79,"b":7},{"r":223,"g":87,"b":7},{"r":223,"g":87,"b":7},{"r":215,"g":95,"b":7},{"r":215,"g":95,"b":7},{"r":215,"g":103,"b":15},{"r":207,"g":111,"b":15},{"r":207,"g":119,"b":15},{"r":207,"g":127,"b":15},{"r":207,"g":135,"b":23},{"r":199,"g":135,"b":23},{"r":199,"g":143,"b":23},{"r":199,"g":151,"b":31},{"r":191,"g":159,"b":31},{"r":191,"g":159,"b":31},{"r":191,"g":167,"b":39},{"r":191,"g":167,"b":39},{"r":191,"g":175,"b":47},{"r":183,"g":175,"b":47},{"r":183,"g":183,"b":47},{"r":183,"g":183,"b":55},{"r":207,"g":207,"b":111},{"r":223,"g":223,"b":159},{"r":239,"g":239,"b":199},{"r":255,"g":255,"b":255}]
const pixels = []

let width = 10
let height = 5

//get the size of the array
const pixelCount = width * height

function start()
{
    doFireStruct()
    doFireSource()

    doFirePropagation()
}

//generate data structure for the fire
function doFireStruct()
{
    //iterate over all pixels and set them to 0
    for (let i = 0; i < pixelCount; i++)
    {
        pixels[i] = 0
    }
}

//generate the fire source
function doFireSource()
{
    for (let column = 0; column <= width; column++) {
        const overflowIndex = width * height
        const index = (overflowIndex - width) + column
    
        pixels[index] = 36
      }
}

//render the fire to the html file
function doFireRender()
{
    //set the first line of the html table
    let html = "<table cellpadding = 0 cellspacing = 0>"

    //iterate over rows
    for (let row = 0; row < height; row++)
    {
        //for each row add a table row
        html += "<tr>"

        //iterate over columns
        for (let column = 0; column < width; column++)
        {
            //set the index, intensty, and color of the current pixel
            const index     = column + (width * row)
            const intensity = pixels[index]
            const color     = colors[intensity]
            const colorStr  = `${color.r},${color.g},${color.b}`

            //add the pixel to the html
            html += `<td class="pixel" style="backround-color: rgb(${colorStr})">`
            html += "</td>"
        }

        //close the table row
        html += "</tr>"
    }

    //close the table
    html += "</table>"

    //add to main file
    document.querySelector("#fireplace").innerHTML = html
}

//calculate fire propagation
function doFirePropagation()
{
    //iterate over columns
    for (let column = 0; column < width; column++)
    {
        //iterate over rows
        for (let row = 0; row < height; row++)
        {
            //set the index
            const index = column + (width * row)

            //update intensity
            updateIntensityPerPixel(index)
        }
    }

    //render the fire
    doFireRender()
}

//calculate the intensity per pixel
function updateIntensityPerPixel(index)
{
    //get the below pixel
    const below = index + width

    //return if out of range
    if (below >= pixelCount)
        return

    //get a random decay from Math
    const decay = Math.floor(Math.random() * 2)

    //set the new intensity
    const belowIntensity = pixels[below]
    const newIntensity   = belowIntensity - decay >= 0 ? belowIntensity - decay : 0

    pixels[index - decay] = newIntensity
}

start()
*/

