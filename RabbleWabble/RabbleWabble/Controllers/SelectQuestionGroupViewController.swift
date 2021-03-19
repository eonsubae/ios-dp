import UIKit

public class SelectQuestionGroupViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet internal var tableView: UITableView! {
    didSet {
      tableView.tableFooterView = UIView()
    }
  }
  
  // MARK: - Properties
  public let questionGroups = QuestionGroup.allGroups()
  private var selectedQuestionGroup: QuestionGroup!
  
  // MARK: - View Lifecycle  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    deselectTableViewCells()
  }
  
  private func deselectTableViewCells() {
    guard let selectedIndexPaths = tableView.indexPathsForSelectedRows else { return }
    for indexPath in selectedIndexPaths {
      tableView.deselectRow(at: indexPath, animated: false)
    }
  }
}

extension SelectQuestionGroupViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return questionGroups.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell", for: indexPath) as! QuestionGroupCell
    let questionGroup = questionGroups[indexPath.row]
    cell.titleLabel.text = questionGroup.title
    return cell
  }
}

extension SelectQuestionGroupViewController: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedQuestionGroup = questionGroups[indexPath.row]
    return indexPath
  }
  
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let viewController = segue.destination as? QuestionViewController else { return }
    viewController.questionGroup = selectedQuestionGroup
    viewController.delegate = self
  }
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
  public func questionViewController(_ viewController: QuestionViewController,
                                     didCancel questionGroup: QuestionGroup,
                                     at questionIndex: Int) {
    navigationController?.popToViewController(self, animated: true)
  }
  
  public func questionViewController(_ viewController: QuestionViewController,
                                     didComplete questionGroup: QuestionGroup) {
    navigationController?.popToViewController(self, animated: true)
  }
}
