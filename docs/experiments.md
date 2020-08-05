# Running Experiments

Experiments are driven by projects which at a minimum contain the CCT version and 
a cohort comprised of participants.

Assuming the PI has been provisioned at least one CCT, the PI will need to:

1. Create a project
1. Assign a CCT to the project
1. Create a cohort
1. Add participants the cohort
1. Assign the cohort to a project
1. Create an experiment from the project
    * Preview the experiment
    * Test the experiment
1. Run the live experiment (via links sent to participants)
1. Review and export data

## Creating a Project

Projects are managed in the project admin. Only some basic information is required 
remaining components may be added later as they are available.

Projects are the main containers that hold:

* A single CCT version
* Zero or more collaborators
* Zero or more staff
* A single cohort of participants

The CCT available for linking is based on the CCT assigned by the CCT Owner to 
the current PI.

Selection choices for collaborators and staff include all registered users in the
system except CCT Owner and Admin. This allows unique combinations of teams regardless 
of roles on other projects, e.g. a grad student could be a PI on one project while acting 
as staff or collaborator on another project.

See also: [PI guide - Creating a Project](guide_pi.md#creating-projects) 
or [Collaborator Guide - Adding to Projects](guide_collaborator.md#adding-to-a-Project).

## Creating a Cohort

Cohorts are the grouping of participants to assign them as a group to projects.
Participants may belong to multiple cohorts. 

Cohorts are created and managed in the cohort admin but are assigned to projects in the project admin.

See also: [PI](guide_pi.md#creating-cohorts), [Collaborator](guide_collaborator.md#creating-cohorts), or [Staff](guide_staff.md#creating-cohorts) guide.

## Assigning a Corhort to a Project

Cohorts are assigned to projects in the project admin.

See also: [PI](guide_pi.md#creating-cohorts), [Collaborator](guide_collaborator.md#creating-cohorts), or [Staff](guide_staff.md#creating-cohorts) guide.

## Creating Experiments

An Experiment is a group of participant links and additional data generated from the 
project browse list.

In the list of projects click the green Make Links button. The project data will be used to
create a unique experiment containing the experiment data and a collection of links for use by 
participants.

The required minimum amount of configuration to generate an experiment are Project, CCT, Cohort (with at least one participant).

See also: [PI](guide_pi.md#creating-experiments), [Collaborator](guide_collaborator.md#creating-experiments), or [Staff](guide_staff.md#creating-experiments) guide.

## Previewing the Experiment

TBD

## Testing the Eperiment

TBD

## Running the Experiment

The list of links are unique for each participant and only contain a token in the URL, thus all data is kept private, however, it is important to send the appropriate to the related participant and not mis-assign or reuse the links.

## Viewing Collected Data

The Data Collection page will list all data collections ordered by project and experiment creation date. 
Viewing a single item will show all the participant responses for each generated link. If a link was used more
than once, there will be multiple entries.