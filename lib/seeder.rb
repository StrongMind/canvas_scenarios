class Seeder
  include Creators

  def initialize(school)
    @school = school
    @client =  Pandarus::Client.new(
      prefix: "https://courseware-staging.strongmind.com/api",
      token: ENV['TOKEN']
    )
  end

  def call
    @school.each do |object_type, enrollments|
      enrollments.each do |account|
        (account[:users] || []).each do
          create_user
        end
        account[:courses].each do |course|
          create_course
          course[:assignments].each do |assignment|
            create_assignment
            assignment[:enrollments].each do |enrollment|
              create_enrollment
            end
          end
        end
      end
    end
  end
end
