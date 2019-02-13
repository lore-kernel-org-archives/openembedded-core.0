Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D10997C0F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 01:58:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2019 17:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,364,1544515200"; d="scan'208";a="114463624"
Received: from skalamka-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.182.236])
	by orsmga007.jf.intel.com with ESMTP; 12 Feb 2019 17:58:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Feb 2019 14:57:59 +1300
Message-ID: <1634479.1jWiZZ8UfD@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CANNYZj_PY61tmw=JjP7PPqqSVJff6kd=rsv=daNscx9eSkNWSA@mail.gmail.com>
References: <03b301d4c2ed$7497f360$5dc7da20$@gmail.com>
	<CANNYZj_PY61tmw=JjP7PPqqSVJff6kd=rsv=daNscx9eSkNWSA@mail.gmail.com>
MIME-Version: 1.0
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW07'19
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
X-List-Received-Date: Wed, 13 Feb 2019 01:58:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex

On Wednesday, 13 February 2019 6:22:23 AM NZDT Alexander Kanavin wrote:
> On Tue, 12 Feb 2019 at 17:10, <sjolley.yp.pm@gmail.com> wrote:
> > The recipe reporting system integration with the layer index is available
> > at: https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M3/ and the
> > historical data has now been imported.
> 
> Sadly the new RRS still seems to be suffering from the 'outdated info'
> problem. For example glibc, or python3 recipes have been updated to
> latest versions, yet RRS still shows that they haven't been.

We're reliant upon the layer index updating and it appears that's not working 
at the moment. I have asked Michael to look into it. Thanks for the report, 
I'll reply back here when things are sorted out.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



