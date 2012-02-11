import random

'''
import survey
js = survey.JobSeekerSurvey()
es = survey.EmployerSurvey()
'''

JOBSEEKER_FREEDOM = (
	('Work when I want, where I want', '1-3'),
	('Control over work day, leading role', '1-3'),
)
JOBSEEKER_SELFDEV = (
	('Access to courses, certifications, and other personal development is important to me', '1-3'),
)
JOBSEEKER_FINANCIAL = (
	('High salary and access to stock options etc. is very important.', '1-3'),
	('Expected salary level', 'salary'),
)

EMPLOYER_FREEDOM = (
	('Freedom 1-3. 3 is fully results oriented, 1 is Dilbert.', '1-3'),
	('Control over work day and leading role in development, 1-3', '1-3'),
)
EMPLOYER_SELFDEV = (
	('Employer will have access to new certifications and courses.', 'yn'),
	('How many weeks per year, approximately, will be used for this?', 'weeks')
)
EMPLOYER_FINANCIAL = (
	('Estimated salary level', 'salary'),
	('Access to stock options', 'yn')
)

class Survey(object):
	def __init__(self):
		super(Survey, self).__init__()
		self.freedom = self.get_freedom()
		self.selfdev = self.get_selfdev()
		self.financial = self.get_financial()
	
	def random_answer_text(self, category):
		if category == 'yn': return 'Y/N'
		if category == 'weeks': return 'num weeks'
		if category == '1-3': return '1-3'
		if category == 'salary': return 'value'
	
	def random_answer(self, category):
		if category == 'yn': # Return random 0 or 1
			return int(random.getrandbits(1))
		if category == 'weeks':
			# Weeks: Return random 1-10
			return 1 + random.randrange(10)
		if category == '1-3':
			return 1 + random.randrange(3)
		if category == 'salary':
			return 1 + random.choice([300,400,500,600,700,800,900])

class JobSeekerSurvey(Survey):
	def __init__(self):
		print "Job Seeker:"
		super(JobSeekerSurvey, self).__init__()

	def get_freedom(self):
		for i in JOBSEEKER_FREEDOM:
			print '%s (%s): %s' % (i[0], self.random_answer_text(i[1]), self.random_answer(i[1]))
	
	def get_selfdev(self):
		for i in JOBSEEKER_SELFDEV:
			print '%s (%s): %s' % (i[0], self.random_answer_text(i[1]), self.random_answer(i[1]))

	def get_financial(self):
		for i in JOBSEEKER_FINANCIAL:
			print '%s (%s): %s' % (i[0], self.random_answer_text(i[1]), self.random_answer(i[1]))
	
class EmployerSurvey(Survey):
	def __init__(self):
		print "Employer:"
		super(EmployerSurvey, self).__init__()
				
	def get_freedom(self):
		for i in EMPLOYER_FREEDOM:
			print '%s (%s): %s' % (i[0], self.random_answer_text(i[1]), self.random_answer(i[1]))

	def get_selfdev(self):
		for i in EMPLOYER_SELFDEV:
			print '%s (%s): %s' % (i[0], self.random_answer_text(i[1]), self.random_answer(i[1]))

	def get_financial(self):
		for i in EMPLOYER_FINANCIAL:
			print '%s (%s): %s' % (i[0], self.random_answer_text(i[1]), self.random_answer(i[1]))