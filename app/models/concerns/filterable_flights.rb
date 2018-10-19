module FilterableFlights
  extend ActiveSupport::Concern

  included do
	  scope :between, ->(start_date, end_date) { where(date: start_date..end_date) }
		scope :from_date, ->(start_date) { where('date >= ?', start_date) }
		scope :till_date, ->(end_date) { where('date <= ?', end_date) }

		scope :airline, ->(airline) do
		  where('lower("airline") like ?', "%#{airline.downcase}%")
		end

		scope :flight_no, ->(flight_no) do
		  where('lower("flight_no") like ?', "%#{flight_no.downcase}%")
		end

		scope :from_time, ->(time) do
		  where('time::time >= ?', time).or(where('expected::time >= ?', time))
		end

		scope :till_time, ->(time) do
		  where('time::time <= ?', time).or(where('expected::time <= ?', time))
		end

	  def self.filter_by_dates(start_date, end_date)
	    if start_date.present? && end_date.present?
	      between(start_date, end_date).order(:date, :time)
	    elsif start_date.present?
	      from_date(start_date).order(:date, :time)
	    elsif end_date.present?
	      till_date(end_date).order(:date, :time)
	    else
	      all
	    end
	  end
  end
end