export interface ApiResponse {
  get: string;
  parameters: {
    season: string;
    league: string;
    page: number;
  };
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  errors: any[];
  results: number;
  paging: {
    current: number;
    total: number;
  };
  response: ApiPlayer[];
}

export interface ApiPlayer {
  player: ApiPlayerInfo;
  statistics: ApiStatistic[];
}

export interface ApiPlayerInfo {
  id: number;
  name: string;
  firstname?: string;
  lastname?: string;
  age?: number;
  birth: {
    date?: string;
    place?: string;
    country?: string;
  };
  nationality?: string;
  height?: string;
  weight?: string;
  injured?: boolean;
  photo?: string;
}

export interface ApiStatistic {
  team: {
    id: number;
    name: string;
    logo: string;
  };
  league: {
    id: number;
    name: string;
    country: string;
    logo: string;
    flag: string;
    season: number;
  };

  games: {
    appearences?: number;
    lineups?: number;
    minutes?: number;
    number?: number;
    position?: string;
    rating?: string;
    captain?: boolean;
  };

  substitutes: {
    in?: number;
    out?: number;
    bench?: number;
  };

  shots: {
    total?: number;
    on?: number;
  };

  goals: {
    total?: number;
    conceded?: number;
    assists?: number;
    saves?: number;
  };
  passes: {
    total?: number;
    key?: number;
    accuracy?: number;
  };
  tackles: {
    total?: number;
    blocks?: number;
    interceptions?: number;
  };
  duels: {
    total?: number;
    won?: number;
  };
  dribbles: {
    attempts?: number;
    success?: number;
    past?: number;
  };
  fouls: {
    drawn?: number;
    committed?: number;
  };
  cards: {
    yellow?: number;
    yellowred?: number;
    red?: number;
  };
  penalty: {
    won?: number;
    commited?: number;
    scored?: number;
    missed?: number;
    saved?: number;
  };
}
