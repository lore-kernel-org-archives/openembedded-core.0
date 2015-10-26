Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8187E73D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 12:09:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 26 Oct 2015 05:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,201,1444719600"; d="scan'208";a="671857024"
Received: from randjicd-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.7])
	by orsmga003.jf.intel.com with ESMTP; 26 Oct 2015 05:08:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 26 Oct 2015 12:08:35 +0000
Message-ID: <2756512.QMAWZ5dkze@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <562E0FB3.10001@linux.intel.com>
References: <1445634201-13944-1-git-send-email-psidhu@gateworks.com>
	<562E0FB3.10001@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Mon, 26 Oct 2015 12:09:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 October 2015 13:34:11 Alexander Kanavin wrote:
> On 10/24/2015 12:03 AM, Pushpal Sidhu wrote:
> > +Upstream-Status: Backport [webkit-2.10.0]
> 
> Why not update the recipe to latest 2.10 release instead?

At this stage of the release it's too late for upgrades; we could certainly do 
that for master after the release though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

