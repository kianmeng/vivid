defimpl Vivid.Rasterize, for: Vivid.Circle do
  alias Vivid.{Circle, Rasterize}

  @moduledoc """
  Rasterizes a circle into points.


  x^2 + y^2 = r^2

  y = sqrt(pow(r,2) - pow(x)2)
  """

  @doc ~S"""
  Rasterizes a circle

  ## Example

      iex> Vivid.Circle.init(Vivid.Point.init(5,5), 4)
      ...> |> Vivid.Rasterize.rasterize({0, 0, 10, 10})
      MapSet.new([
        %Vivid.Point{x: 1, y: 4}, %Vivid.Point{x: 1, y: 5},
        %Vivid.Point{x: 1, y: 6}, %Vivid.Point{x: 2, y: 2},
        %Vivid.Point{x: 2, y: 3}, %Vivid.Point{x: 2, y: 7},
        %Vivid.Point{x: 2, y: 8}, %Vivid.Point{x: 3, y: 2},
        %Vivid.Point{x: 3, y: 8}, %Vivid.Point{x: 4, y: 1},
        %Vivid.Point{x: 4, y: 9}, %Vivid.Point{x: 5, y: 1},
        %Vivid.Point{x: 5, y: 9}, %Vivid.Point{x: 6, y: 1},
        %Vivid.Point{x: 6, y: 9}, %Vivid.Point{x: 7, y: 2},
        %Vivid.Point{x: 7, y: 8}, %Vivid.Point{x: 8, y: 2},
        %Vivid.Point{x: 8, y: 3}, %Vivid.Point{x: 8, y: 7},
        %Vivid.Point{x: 8, y: 8}, %Vivid.Point{x: 9, y: 4},
        %Vivid.Point{x: 9, y: 5}, %Vivid.Point{x: 9, y: 6}
      ])
  """

  def rasterize(circle, bounds) do
    circle
    |> Circle.to_polygon
    |> Rasterize.rasterize(bounds)
  end
end