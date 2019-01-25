module Scenarios
  def simple_scenario
    user = {
      user: {}
    }
    {
      accounts: [
        {
          users: [
            user
          ],
          courses: [
            {
              assignments: [
                { enrollments: [ user ] }
              ]
            }
          ]
        }
      ]
    }
  end
end
