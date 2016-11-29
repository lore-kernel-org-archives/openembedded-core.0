Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 96D1B71AB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:10:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 29 Nov 2016 01:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,715,1473145200"; d="scan'208";a="10935436"
Received: from schan1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.189.70])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2016 01:10:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 29 Nov 2016 22:10:50 +1300
Message-ID: <1704738.PhmsSFoDfP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <bdecee11-e5f5-d34d-fb09-f247dfb460d6@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<CAJTo0LYTbP3h5T+YEMiESUCwq0YM6QXtj5+_nr0ZWMH1Z3mhNQ@mail.gmail.com>
	<bdecee11-e5f5-d34d-fb09-f247dfb460d6@windriver.com>
MIME-Version: 1.0
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEZpeGVzIGZvciBlU0RLIGFuZCB0ZXN0c2RrZXh0?=
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
X-List-Received-Date: Tue, 29 Nov 2016 09:10:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 29 Nov 2016 15:38:50 Robert Yang wrote:
> On 11/17/2016 05:02 PM, Burton, Ross wrote:
> > On 17 November 2016 at 06:55, Patchwork
> > <patchwork@patchwork.openembedded.org> 
> > <mailto:patchwork@patchwork.openembedded.org>> wrote:
> >     * Patch            [7/8] oeqa/sdkext/devtool.py: skip
> >     test_extend_autotools_recipe_creation when no libxml2
> >     
> >       Issue            Commit shortlog is too long [test_shortlog_length]
> >       Suggested fix    Edit shortlog so that it is 80 characters or less
> >     
> >     (currently 82 characters)
> > 
> > I'm not sure we've ever been super-strict on this, so I'm wondering if
> > warning over 90 is sensible so that we allow an extra two characters when
> > function names are long but still detect when someone has put an essay in
> > the first line (which does happen if the submitter isn't aware of the git
> > convention).
> 
> Ping, do I have to make the subject line shorter and resend the patches,
> please ?

No, no need to do that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

