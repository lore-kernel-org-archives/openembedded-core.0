Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9596965CC3;
	Sun, 20 Mar 2016 21:26:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2016 14:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,367,1455004800"; d="scan'208";a="941402876"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2016 14:26:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 21 Mar 2016 10:26:29 +1300
Message-ID: <19981776.1mF1NMTY9t@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.4-301.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <20160319002311.GA1738@linux-yxv0>
References: <20160317144357.GB2553@jama> <20160319002311.GA1738@linux-yxv0>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2016-03-16
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
X-List-Received-Date: Sun, 20 Mar 2016 21:26:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 18 Mar 2016 20:23:11 Trevor Woerner wrote:
> On Thu 2016-03-17 @ 03:43:57 PM, Martin Jansa wrote:
> > c278358 metadata-revs: provide more information
> 
> I think the general consensus was to not accept patch c278358 since it
> affected the layout of a file that was expected to be processed by scripts.
> 
> > e2bf30c buildhistory.bbclass: metadata-revs show repo parent
> 
> But I *think* everyone was okay with this one?

I guess I'm OK with it yes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

