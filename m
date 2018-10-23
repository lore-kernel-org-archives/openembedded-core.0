Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5FB79312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 21:14:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2018 14:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,417,1534834800"; d="scan'208";a="101858330"
Received: from mananrde-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.144.77])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2018 14:14:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: yocto@yoctoproject.org
Date: Wed, 24 Oct 2018 10:14:48 +1300
Message-ID: <2829165.0Ht5z2aexs@localhost.localdomain>
Organization: Intel Corporation
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: 2.6 migration guide
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
X-List-Received-Date: Tue, 23 Oct 2018 21:14:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks

When Scott prepares the migration guide for a release, he usually looks to me 
to collate the notable changes for it (those requiring user intervention). I 
haven't prepared anything yet though and the 2.6 release is fast approaching. 
Can anyone who has been involved in or is aware of such changes in master for 
upcoming 2.6 (thud) make a note of it on the wiki in raw form on this page:

  https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

Scott and I will take care of cleaning it up, so things added there don't need 
to be perfect. 

I will also be doing my usual trawl through the commits in the release for the 
more general changelog, so most things will get picked up that way, but it's 
really helpful if people with first-hand knowledge of the implications of some 
of these changes are involved in how they get documented.

Thanks,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre



