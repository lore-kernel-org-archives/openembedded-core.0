Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DC30660EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 18:39:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Nov 2013 10:39:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="405195625"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.196.57]) ([10.7.196.57])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2013 10:39:19 -0800
Message-ID: <1383849558.5378.45.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 07 Nov 2013 10:39:18 -0800
In-Reply-To: <CADkTA4O-dTZO3uKtdbA3bnbhsxZUzuw3_YZoz0tRB+aeYy5WvQ@mail.gmail.com>
References: <cover.1383677174.git.bruce.ashfield@windriver.com>
	<1383684977.8901.133.camel@x121e.pbcl.net>
	<CADkTA4O-dTZO3uKtdbA3bnbhsxZUzuw3_YZoz0tRB+aeYy5WvQ@mail.gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] linux-yocto/3.10: fix qemuarm boot and spurious mips build warning
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
X-List-Received-Date: Thu, 07 Nov 2013 18:39:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-05 at 22:21 -0500, Bruce Ashfield wrote:
> On Tue, Nov 5, 2013 at 3:56 PM, Phil Blundell <pb@pbcl.net> wrote:
> > On Tue, 2013-11-05 at 13:47 -0500, Bruce Ashfield wrote:
> >> I don't have anything extra to add outside of what I put in the
> >> patch commit log ..
> >
> > That's certainly a good thing and to be applauded, but in this situation
> > maybe you could consider just sending the patch without a cover letter.
> >
> 
> I honestly dislike lone patches in nearly every situation. So let's
> just say that
> opinions differ and leave it at that.

For anything other than single patches (which I understand this is)
there is a preference for using the create-pull-request and
send-pull-request tools which ensure the patches are available via a git
pull from a public repository and also apply a cover letter. Often times
I leave the cover letter blank for the same reason Bruce has stated
here, and I think that's a reasonable approach, especially for a short
or an eclectic set of changes.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



