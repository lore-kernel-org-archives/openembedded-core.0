Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A7CA3605C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 19:28:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2017 12:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,424,1503385200"; d="scan'208";a="326701732"
Received: from sksingh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.188])
	by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2017 12:28:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Oct 2017 08:28:00 +1300
Message-ID: <1755616.0AH4fpbz42@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJTo0LaHVjE+C9mv7h8c1LQ-Sx-u5PsbxQEeDjp-2e9itvqYkQ@mail.gmail.com>
References: <CAMKF1srGH8tNmFMvqRmV0jXQz+HAVwrXYw1v6EoZQZrb_poDrg@mail.gmail.com>
	<CAJTo0LaHVjE+C9mv7h8c1LQ-Sx-u5PsbxQEeDjp-2e9itvqYkQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devtool modify errors on second recipe
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
X-List-Received-Date: Mon, 23 Oct 2017 19:28:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 23 October 2017 10:26:38 PM NZDT Burton, Ross wrote:
> On 23 October 2017 at 06:03, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > I am seeing this errors message consistently since few weeks on master
> > when using
> > devtool modify
> >
> 
> <waves hand like a psychic>You're running Python 3.6.
> 
> There's a patch on the bitbake list for this, and I believe it will be in
> rocko before it releases.

Richard told me it likely wouldn't, FYI.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

