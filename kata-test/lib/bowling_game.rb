class BowlingGame
	attr_reader :first_in_frame

	def initialize
		@first_in_frame = 0
	end

	def pins(rolls)
		@rolls = rolls
	end

	def score
		frame = 0
		score = 0

		while frame < 10
			if spare?
				score += 10 + bonus_for_spare
			else
				score += standard_frame_score
			end

			frame += 1
			@first_in_frame += 2
		end

		score
	end

	private

	def spare?
		@rolls[first_in_frame] + @rolls[first_in_frame + 1] == 10
	end

	def bonus_for_spare
		@rolls[first_in_frame + 2]
	end

	def standard_frame_score
		@rolls[first_in_frame] + @rolls[first_in_frame + 1]
	end
end
