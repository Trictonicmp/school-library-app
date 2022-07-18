require_relative '../classes/teacher'

describe Teacher do
  describe 'Constructor' do
    it 'Creates a new teacher specialized on chemistry with name "Mario" with age 47 and no parent_permission' do
      teacher = Teacher.new('Chemistry', 47, 'Mario', parent_permission: false)
      expect(teacher.name?).to eql('Mario')
      expect(teacher.age?).to eql(47)
      expect(teacher.can_use_services?).to eql(true)
    end
  end

  describe 'Can use services to always be true' do
    teacher = Teacher.new('Chemistry', 16, 'Mario', parent_permission: false)
    it 'should return true although age is 16 and parent_permission is set to false' do
      expect(teacher.can_use_services?).to eql(true)
    end
  end
end
