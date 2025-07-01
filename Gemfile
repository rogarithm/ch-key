# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.0'

gem 'sinatra'
gem 'rack' # rackup 실행용
gem 'erb'  # sinatra의 기본 템플릿 엔진

# 개발 및 테스트용
group :development, :test do
  gem 'minitest'
  gem 'rspec'
  gem 'rack-test'  # Sinatra 앱 테스트에 필요
  gem 'pry'        # 디버깅
end

# 선택적으로 추가 가능한 것들:
# gem 'dotenv'      # 환경변수 관리
# gem 'rerun'       # 파일 변경 시 자동으로 재시작

gem "rackup", "~> 2.2"
gem "puma", "~> 6.6"
