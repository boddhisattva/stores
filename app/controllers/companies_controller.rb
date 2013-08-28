class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  require 'active_support/builder' unless defined?(Builder)
  respond_to :html, :json, :js

  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.js # new.js.erb --> You don't have to explicity specify it.. its just
      # that you need to specify
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    Rails.logger.info "\n*****\nParams Company: #{params[:company]} ********\n"

    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.js
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def company_division_stats
    @all_companies = Company.joins(:divisions).select('companies.name, count(divisions.id) as total').where('divisions.company_id = companies.id').group('companies.id').order('count(divisions.id) DESC')

    #@all_companies = Company.joins(:divisions).select('companies.name as label, count(divisions.id)').where('divisions.company_id = companies.id').group('companies.id').order('count(divisions.id) DESC').count

    #for each_company in @all_companies
    # puts each_company.name
    # puts each_company.total
    #end

    #@referral_source = Client.count(:all, :group => :referral_source)
    #remap = @all_companies.map {|k, v| { Name: k, Count: v} }
    #
    #remap = a.map {|k, v| { Name: k, Count: v} }
    #
    #Rails.logger.info "\n*******All companies:- #{@all_companies}********\n"

    respond_to do |format|
      unless @all_companies.nil?
        format.json { render json: @all_companies.to_json, status: :created } #in the browser url would be:- localhost:3000/company_division_stats.json
        #format.json {render 'company_division_stats.json.jbuilder'} - throws error currently
        format.html #{ redirect_to @company, notice: 'Company was successfully created.' }
      end

      #if @company.save
      #  format.html { redirect_to @company, notice: 'Company was successfully created.' }
      #  format.js
      #  format.json { render json: @company, status: :created, location: @company }
      #else
      #  format.html { render action: "new" }
      #  format.json { render json: @company.errors, status: :unprocessable_entity }
      #end

    end

    #for each_company in all_companies
    #
    #end
    #respond_to :json
    #respond_with @all_companies
  end



  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    Rails.logger.info "******\n\n\nCompany: #{params[:company]}***********\n\n\n"
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.js
      format.json { head :no_content }
    end
  end
end
