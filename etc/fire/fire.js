const firePixels   = []
const colorPallete = [{"r":7,"g":7,"b":7},{"r":31,"g":7,"b":7},{"r":47,"g":15,"b":7},{"r":71,"g":15,"b":7},{"r":87,"g":23,"b":7},{"r":103,"g":31,"b":7},{"r":119,"g":31,"b":7},{"r":143,"g":39,"b":7},{"r":159,"g":47,"b":7},{"r":175,"g":63,"b":7},{"r":191,"g":71,"b":7},{"r":199,"g":71,"b":7},{"r":223,"g":79,"b":7},{"r":223,"g":87,"b":7},{"r":223,"g":87,"b":7},{"r":215,"g":95,"b":7},{"r":215,"g":95,"b":7},{"r":215,"g":103,"b":15},{"r":207,"g":111,"b":15},{"r":207,"g":119,"b":15},{"r":207,"g":127,"b":15},{"r":207,"g":135,"b":23},{"r":199,"g":135,"b":23},{"r":199,"g":143,"b":23},{"r":199,"g":151,"b":31},{"r":191,"g":159,"b":31},{"r":191,"g":159,"b":31},{"r":191,"g":167,"b":39},{"r":191,"g":167,"b":39},{"r":191,"g":175,"b":47},{"r":183,"g":175,"b":47},{"r":183,"g":183,"b":47},{"r":183,"g":183,"b":55},{"r":207,"g":207,"b":111},{"r":223,"g":223,"b":159},{"r":239,"g":239,"b":199},{"r":255,"g":255,"b":255}]

const width  = 25
const height = 70

const pixelCount = width * height

function main()
{
    doFireStruct()
    doFireSource()

    setInterval(doFirePropagation, 50)
}

function doFireStruct()
{
    for (let i = 0; i < pixelCount; i++)
    {
        firePixels[i] = 0
    }
}

function doFireSource()
{
    for (let column = pixelCount - 1; column >= pixelCount - width; column--)
    {
        firePixels[column] = 36
    }
}

function doFirePropagation()
{
    for (let column = 0; column < width; column++)
    {
        for (let row = 0; row < height; row++) {
            const index = column + ( width * row )
            doUpdateFireIntensity(index)
        }
    }

    doFireRender(false)
}

function doUpdateFireIntensity(index)
{
    const below = index + width

    if (below >= pixelCount)
        return

    const decay = Math.floor(Math.random() * 2)
    const belowIntensity = firePixels[below]
    const newIntensity   = belowIntensity - decay >= 0 ? belowIntensity - decay : 0

    firePixels[index - decay] = newIntensity
}

function doFireRender(debug)
{
    let html = "<table cellpadding = 0 cellspacing = 0>"

    for (let row = 0; row < height; row++)
    {
        html += "<tr>"

        for (let column = 0; column < width; column++)
        {
            const index = column + ( width * row )
            const intensity = firePixels[index]

            if (debug === true)
            {
                html += "<td>"
                html += `<div class = "pixel-index">${index}</div>`
                html += intensity
                html += "</td>"
            }
            else
            {
                const color    = colorPallete[intensity]
                const colorStr = `${color.r},${color.g},${color.b}`

                html += `<td class = "pixel" style = "background-color: rgb(${colorStr})"`
                html += "</td>"
            }
        }

        html += "</tr>"
    }

    html += "</table>"

    document.querySelector("#fireplace").innerHTML = html
}

main()
