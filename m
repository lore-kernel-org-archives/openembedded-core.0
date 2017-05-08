Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B9E166AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 22:15:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 15:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,311,1491289200"; d="scan'208";a="98967920"
Received: from nmaideen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.191.208])
	by fmsmga005.fm.intel.com with ESMTP; 08 May 2017 15:15:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 09 May 2017 10:15:23 +1200
Message-ID: <19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 08 May 2017 22:15:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 8 May 2017 11:39:53 PM NZST Alexander Kanavin wrote:
> On 05/08/2017 02:33 PM, Jussi Kukkonen wrote:
> > Sato is extremely lightweight (not just runtime-wise but with regards to
> > build time and maintenance effort). I admit I'm not familiar with LXDE
> > but other DEs known as lightweight are in reality on another level
> > compared to Sato... Sato projects themselves are tiny and depend on very
> > little: this is quite beneficial since it keeps the automated test
> > runtimes reasonable.
> 
> LXDE in particular is Gtk2 based, it's no longer being developed, and 
> has been superseded by LXQt. So it's a non-starter (and so is LXQt, 
> which should be clear from its name :).

FWIW I think this is a little short-sighted. Why are we ruling out Qt exactly?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

