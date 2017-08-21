CREATE KEYSPACE IF NOT EXISTS pf WITH replication = { 'class': 'SimpleStrategy', 'replication_factor': 3 } ;

CREATE TYPE IF NOT EXISTS pf.external_urls (
    spotify text
) ;

CREATE TYPE IF NOT EXISTS pf.follower (
    href text,
    total int
) ;

CREATE TYPE IF NOT EXISTS pf.image (
    height int,
    url text,
    width int
) ;

CREATE TYPE IF NOT EXISTS pf.user (
    birthdate text,
    country text,
    display_name text,
    email text,
    external_urls frozen <pf.external_urls>,
    followers frozen <pf.follower>,
    href text,
    id text,
    images List<frozen <pf.image>>,
    product text,
    type text,
    url text,
) ;

CREATE TABLE IF NOT EXISTS pf.user ( id text PRIMARY KEY, user frozen <pf.user> ) ;

CREATE TYPE IF NOT EXISTS pf.authorization (
    user_id text,
    access_token text,
    refresh_token text,
    expires_in date
) ;

CREATE TABLE IF NOT EXISTS pf.authorization ( user_id text PRIMARY KEY, auth frozen <pf.authorization> ) ;

CREATE TABLE IF NOT EXISTS pf.new_album ( retrieval date PRIMARY KEY, album_ids List<text> ) ;

CREATE TABLE IF NOT EXISTS pf.track_recommendation ( user_id text, retrieval date, track_ids List<text>, PRIMARY KEY (user_id, retrieval)) ;

CREATE TYPE IF NOT EXISTS pf.artist (
  external_urls frozen<pf.external_urls>,
  followers List<frozen<pf.follower>>,
  genre List<text>,
  href text,
  id text,
  images List<frozen<pf.image>>,
  name text,
  popularity int,
  type text,
  uri text
) ;

CREATE TABLE IF NOT EXISTS pf.artist (id text PRIMARY KEY, artist frozen<pf.artist>) ;

CREATE TYPE IF NOT EXISTS pf.copyright (
  text text,
  type text
) ;

CREATE TYPE IF NOT EXISTS pf.external_ids (
  upc text
) ;

CREATE TYPE IF NOT EXISTS pf.album (
  album_type text,
  artist_ids List<text>,
  available_markets List<text>,
  copyrights List<frozen<pf.copyright>>,
  external_ids frozen<pf.external_ids>,
  external_urls frozen<pf.external_urls>,
  genres List<text>,
  href text,
  id text,
  images List<frozen<pf.image>>,
  name text,
  popularity int,
  release_date text,
  release_date_precision text,
  track_ids List<text>,
  type text,
  uri text
) ;

CREATE TABLE IF NOT EXISTS pf.album ( album_id text PRIMARY KEY, album frozen<pf.album>) ;

CREATE TYPE IF NOT EXISTS pf.track (
  album_ids List<text>,
  artist_ids List<text>,
  available_markets List<text>,
  disc_number int,
  duration_ms int,
  explicit boolean,
  external_urls frozen<pf.external_urls>,
  href text,
  id text,
  name text,
  popularity int,
  preview_url text,
  track_number int,
  type text,
  uri text
) ;

CREATE TABLE IF NOT EXISTS pf.track ( track_id text PRIMARY KEY, track frozen<pf.track>) ;

CREATE TYPE IF NOT EXISTS pf.track_audio_features (
  danceability float,
  energy float,
  key int,
  loudness float,
  mode int,
  speechiness float,
  acousticness float,
  instrumentalness float,
  liveness float,
  valence float,
  tempo float,
  type text,
  id text,
  uri text,
  track_href text,
  analysis_url text,
  duration_ms int,
  time_signature int
) ;

CREATE TABLE IF NOT EXISTS pf.track_audio_features ( track_id text PRIMARY KEY, track_audio_features frozen<pf.track_audio_features>) ;

CREATE TABLE IF NOT EXISTS pf.track_reaction ( user_id text, track_id text, reaction int, PRIMARY KEY (user_id, track_id)) ;
