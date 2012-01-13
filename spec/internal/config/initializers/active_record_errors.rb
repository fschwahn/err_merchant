module ActiveRecord
  class ActiveRecordError < StandardError
  end

  class RecordNotFound < ActiveRecordError
  end

  class RecordNotSaved < ActiveRecordError
  end
end
