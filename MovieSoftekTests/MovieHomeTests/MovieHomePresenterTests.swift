
import XCTest
@testable import MovieSoftek

final class MovieHomePresenterTests: XCTestCase {

    var sut: MovieHomePresenter!
    var mockView: MockMovieHomeView!
    var mockRouter: MockMovieHomeRouter!
    var mockInteractor: MockMovieHomeInteractor!
    var dispatchQueueMock:DispatchQueueType!

    override func setUp() {
        super.setUp()
        mockView = MockMovieHomeView()
        mockRouter = MockMovieHomeRouter()
        mockInteractor = MockMovieHomeInteractor()
        dispatchQueueMock = DispatchQueueMock()
        sut = MovieHomePresenter(router: mockRouter, interactor: mockInteractor, mainDispatchQueue: dispatchQueueMock)
        sut.setViewProtocol(view: mockView)
    }

    override func tearDown() {
        sut = nil
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        dispatchQueueMock = nil
        super.tearDown()
    }

    func testLoadMovies() {
        
        sut.totalPages = 10
        sut.page = 5
        sut.isFromStorage = false
        
        sut.loadMovies()
        
        XCTAssertTrue(mockView.isLoadingUpdated)
        XCTAssertTrue(mockInteractor.getMovieListCalled)
    }

    func testShowMovieSelection() {
        let movie1 = MovieEntity(id: 1, title: "Test Movie", rating: "8/10", releaseDate: "", overview: "")
        let movie2 = MovieEntity(id: 2, title: "Test Movie 2 ", rating: "9/10", releaseDate: "", overview: "")
        sut.movies = [movie1,movie2]
        sut.showMovieSelection(with: 0)
        XCTAssertTrue(mockRouter.movieDetailNavigationCalled)
        XCTAssertEqual(mockRouter.movieDetailEntity, movie1)

    }
    
    func testGetMoviesIsNotCalledWhenIsFromStorage(){
        sut.totalPages = 10
        sut.page = 15
        sut.isFromStorage = true
        
        sut.loadMovies()
        
        XCTAssertFalse(mockInteractor.getMovieListCalled)
    }
    
    func testGetMoviesIsNotCalledWhenTotalPageIsMorethanCurrentPage(){
        sut.totalPages = 10
        sut.page = 15
        
        sut.loadMovies()
        
        XCTAssertFalse(mockInteractor.getMovieListCalled)
    }
    
    func testGetMoviesIsCalledWhenTotalPageIsNil(){
        sut.totalPages = nil
        
        sut.loadMovies()
        
        XCTAssertTrue(mockInteractor.getMovieListCalled)
    }
    
    
    func testMoviestListDidFetch() {
        let movieListResponse = MovieListResponse(page: 1, results: [], totalPages: 1)
        
        sut.moviestListDidFetch(moviesResponse: movieListResponse)
        
        XCTAssertFalse(mockView.isLoading)
        XCTAssertEqual(sut.movies.count, movieListResponse.results.count)
        XCTAssertTrue(mockInteractor.saveDataToStorageCalled)
    }

    func testMoviestListDidFetchFromStorage() {
        let movies = [MovieEntity(id: 1, title: "Test Movie", rating: "8/10", releaseDate: "", overview: "")]
        
        sut.moviestListDidFetchFromStorage(movies: movies)
        
        XCTAssertTrue(sut.isFromStorage)
        XCTAssertTrue(mockView.showMoviesCalled)
    }

    func testMoviesListFailed() {
        
        sut.moviesListFailed(error: "Error")
        
        XCTAssertFalse(mockView.isLoading)
        XCTAssertEqual(mockRouter.errorShown, "Error")
    }
}
