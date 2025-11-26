# METsAdvisor

MetsAdvisor is a command-line tool that calculates your weekly METs (Metabolic Equivalents) based on your daily steps and exercise habits. It helps you determine whether you are getting enough physical activity for maintaining good health, and provides suggestions for improvement.

## What are METs?

METs are Metabolic Equivalents.

> METs (Metabolic Equivalents) are units used to express the intensity of physical activity.

> “One MET is defined as the energy cost of sitting quietly…
> moderate activity is about four times, and vigorous activity is about eight times higher.”
> — WHO: Global Physical Activity Questionnaire (GPAQ) Analysis Guide
> https://www.who.int/publications/i/item/9789240015128

In short:

- 1 MET = resting energy expenditure
- 4 METs = moderate activity
- 8 METs = vigorous activity

METs are used worldwide to evaluate physical activity levels.

## Installation

Install the gem:

```
gem install mets_advisor
```

## Usage

```
mets_advisor
```

The tool will guide you through:

1. Language selection
2. Daily average steps
3. Weekly exercise frequency
4. Exercise intensity and type
5. Daily exercise duration

## Examples

```
Please select your language / 言語を選択してください
→ 日本語
  English
  Français
  Español
```

```
Please select your language / 言語を選択してください: English

What is your daily average steps per week?: 3000
How many days per week do you exercise?: 2

Choose the intensity of exercise you usually do: Moderate (e.g. brisk walking)

Choose the activity that applies to you: Slow jogging
How many minutes per day do you exercise in total?: 30

🚨You are not getting enough exercise!🚨
---------------------------------------------------
Your physical activity is lacking by 【10 METs】.
Increasing physical activity can reduce the risk of lifestyle diseases.
💡Here is a guideline for the required weekly physical activity💡
---------------------------------------------------
🚶Walking(4 METs): 150+ min (avg 21 min/day)
🏃Light Running(9 METs): 66+ min (avg 9 min/day)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hirokiej/mets_advisor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/hirokiej/mets_advisor/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MetsAdvisor project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hirokiej/mets_advisor/blob/main/CODE_OF_CONDUCT.md).
