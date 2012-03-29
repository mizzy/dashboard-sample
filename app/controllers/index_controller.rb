class IndexController < ApplicationController
  def index
  end

  def accesses
    conn = Mongo::Connection.new('localhost')
    db   = conn['fluent']
    coll = db['debug']

    m = <<"MAP"
function() {
    emit(this.time, 1);
};
MAP

    r = <<"REDUCE"
function(key, values) {
    return values.length;
};
REDUCE

    @results = coll.mapreduce(m, r, { out: { inline: 1 }, :raw => true })["results"]
  end

end
