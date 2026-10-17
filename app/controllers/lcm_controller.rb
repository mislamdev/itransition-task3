class LcmController < ApplicationController
  # GET /lcm/:email_token?x=<int>&y=<int>
  # Returns the least common multiple of x and y as a plain digit-only string,
  # or "NaN" if either is missing or not a non-negative integer.
  def compute
    x = params[:x]
    y = params[:y]

    unless valid_non_negative_integer?(x) && valid_non_negative_integer?(y)
      return render plain: 'NaN'
    end

    xi = x.to_i
    yi = y.to_i
    render plain: xi.lcm(yi).to_s
  end

  private

  def valid_non_negative_integer?(value)
    value.is_a?(String) && value.match?(/\A\d+\z/)
  end
end