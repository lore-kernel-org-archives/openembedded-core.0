Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>)
	id 1QWYfw-0000MD-EB; Tue, 14 Jun 2011 20:49:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5EIjrlu019935
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jun 2011 11:45:53 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 14 Jun 2011 11:45:53 -0700
Message-ID: <4DF7AC60.3050803@windriver.com>
Date: Tue, 14 Jun 2011 13:45:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: tsc@lists.openembedded.org
Subject: The Commit and Patch Message Guidelines -- Approved
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jun 2011 18:49:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On behalf of the Technical Steering Committee,

I am happy to announce the approval of the final version of the Commit and Patch
Message Guidelines.

Thank you to everyone who contributed to document.  If anyone has any questions,
comments or concerns feel free to let me or any of the other TSC members know.

See http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines

Some of you may be wondering what this is, below is a snippet from the guidelines.

This set of guidelines is intended to help both the developer and reviewers of
changes determine reasonable patch headers and change commit messages. Often
when working with the code, you forget that not everyone is as familiar with the
problem and/or fix as you are. Often the next person in the code doesn't
understand what or why something is done so they quickly look at patch header
and commit messages. Unless these messages are clear it will be difficult to
understand the relevance of a given change and how future changes may impact
previous decisions.

This policy refers both to patches that are being applied by recipes as well as
commit messages that are part of the source control system, usually git. A patch
file needs a header in order to describe the specific changes that are made
within that patch, while a commit message describes one or more changes to the
overall project or system. Both the patch headers and commit messages require
the same attention and basic details, however the purposes of the messages are
slightly different. A commit message documents all of the changes made as part
of a commit, while a patch header documents items specific to a single patch. In
many cases the patch header can also be used as the commit message.

This policy does not cover the testing of the changes, or the technical criteria
for accepting a patch.

By following these guidelines we will have a better record of the problems and
solutions made over the course of development. It will also help establish a
clear provenance of all of the code and changes.

Approved by the Technical Steering Committee 2011/06/09.


