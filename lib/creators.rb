module Creators
  def create_assignment
    @new_assignment = @client.create_assignment(@new_course.id, { assignment: { name: Faker::Lorem.sentence } })
    puts "Created assignment #{@new_assignment.name} - #{@new_assignment.id}"
  end

  def create_course
    @new_course = @client.create_new_course 1, { course: { name: Faker::Lorem.sentence } }
    puts "Created course #{@new_course.name} - #{@new_course.id}"
  end

  def create_enrollment
    @new_enrollment = @client.enroll_user_courses(@new_course.id, {enrollment: {user_id: @new_user.id}})
    puts "Created enrollment #{@new_enrollment.name} - #{@new_enrollment.id}"
  end

  def create_user

    @new_user = @client.create_user(
      1,
      user: { name: Faker::Name.name },
      pseudonym: { unique_id: Faker::Internet.email }
    )
    puts "Created user #{@new_user.name} - #{@new_user.id}"
  end
end
