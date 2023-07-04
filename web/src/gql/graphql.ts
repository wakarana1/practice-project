/* eslint-disable */
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
  /** An ISO 8601-encoded datetime */
  ISO8601DateTime: { input: any; output: any; }
};

export type District = {
  __typename?: 'District';
  createdAt: Scalars['ISO8601DateTime']['output'];
  id: Scalars['ID']['output'];
  name: Scalars['String']['output'];
  updatedAt: Scalars['ISO8601DateTime']['output'];
};

export type Household = {
  __typename?: 'Household';
  createdAt: Scalars['ISO8601DateTime']['output'];
  householdSize: Scalars['Int']['output'];
  id: Scalars['ID']['output'];
  incomeMax: Scalars['Int']['output'];
  incomeMin: Scalars['Int']['output'];
  tierId?: Maybe<Scalars['Int']['output']>;
  updatedAt: Scalars['ISO8601DateTime']['output'];
};

export type Mutation = {
  __typename?: 'Mutation';
  /** An example field added by the generator */
  testField: Scalars['String']['output'];
};

export type Query = {
  __typename?: 'Query';
  /** List of Districts */
  districts: Array<District>;
  /** List of Households by Tier ID */
  households?: Maybe<Array<Household>>;
  /** List of Tiers by District ID */
  tiers: Array<Tier>;
  /** List of TuitionCredits by Tier ID */
  tuitionCredits?: Maybe<Array<TuitionCredit>>;
};


export type QueryHouseholdsArgs = {
  tierId: Scalars['Int']['input'];
};


export type QueryTiersArgs = {
  districtId: Scalars['Int']['input'];
};


export type QueryTuitionCreditsArgs = {
  tierId: Scalars['Int']['input'];
};

export type Tier = {
  __typename?: 'Tier';
  createdAt: Scalars['ISO8601DateTime']['output'];
  districtId: Scalars['Int']['output'];
  /** List of Household breakdowns, if any */
  households?: Maybe<Array<Household>>;
  id: Scalars['ID']['output'];
  name: Scalars['String']['output'];
  /** List of Tuition Credits, if any */
  tuitionCredits?: Maybe<Array<TuitionCredit>>;
  updatedAt: Scalars['ISO8601DateTime']['output'];
};

export type TuitionCredit = {
  __typename?: 'TuitionCredit';
  createdAt: Scalars['ISO8601DateTime']['output'];
  extendedDayCredit: Scalars['Int']['output'];
  fullDayCredit: Scalars['Int']['output'];
  halfDayCredit: Scalars['Int']['output'];
  id: Scalars['ID']['output'];
  rating: Scalars['Int']['output'];
  tierId?: Maybe<Scalars['Int']['output']>;
  updatedAt: Scalars['ISO8601DateTime']['output'];
};
