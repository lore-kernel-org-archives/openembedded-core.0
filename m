Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 36C4A6093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 00:35:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 09 Oct 2016 17:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,469,1473145200"; d="scan'208";a="770697128"
Received: from klee32-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.184.241])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2016 17:35:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 13:35:22 +1300
Message-ID: <5531053.vz3bUekSfr@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
MIME-Version: 1.0
Subject: Commit messages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2016 00:35:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

I've been going through the commits in preparation for our release notes, and 
unfortunately what I'm seeing is that the number of empty or incomplete commit 
messages has noticeably increased over previous releases. Commit messages are 
vitally important to providing a readable history, not just in support of 
preparing release notes, but also if you're trying to track down a regression 
or any other reason you might want to go back and find out what has been done 
and most importantly *why*.

Here are our commit message guidelines, which have been in place for some 
time:

  http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

I know everyone's busy, but please take 5 minutes to read these if you haven't 
recently and try to keep them in mind when writing commit messages. No commit 
is too trivial for a complete commit message.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

