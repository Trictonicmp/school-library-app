require_relative '../classes/core/student'
require_relative '../classes/core/classroom'

describe Student do
  describe 'Constructor' do
    it 'Creates a new student on classroom 4 with name "Raul" with age 16 and no parent_permission' do
      student = Student.new(nil, 16, 'Raul', parent_permission: false)
      expect(student.name?).to eql('Raul')
      expect(student.age?).to eql(16)
      expect(student.can_use_services?).to eql(false)
    end
  end

  describe 'Play Hockey method' do
    student = Student.new(nil, 16, 'Raul', parent_permission: false)
    it "returns ¯\(ツ)/¯" do
      expect(student.play_hockey).to eql("¯\(ツ)/¯")
    end
  end

  describe 'Add classroom to student' do
    classroom = Classroom.new('Arts')
    student = Student.new(classroom, 20, 'maximilianus', parent_permission: false)
    describe 'Check if classroom contains student "maximilianus" and student contains the classroom' do
      it 'returns true if student is in the classroom' do
        expect(classroom.students.include?(student)).to be(true)
      end

      it 'returns true if student\'s classroom is the classroom declared beofre' do
        expect(student.classroom).to eql(classroom)
      end
    end
  end
end
