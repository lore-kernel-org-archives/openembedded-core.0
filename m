Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B62BB71A71
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491229455; x=1522765455;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=MMS/DHIIiXGr5w/r+M7TrzvHM1G2NUqVVEGzeUJGnLc=;
	b=F+gS6VFeCLb4KYIkfGHbJzvG4LhFlBrDmGoImj/Wg76TMy8ePGtq/SYa
	HWrL6INhYIhlkNmVIRwvIsIq8nF94A==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2017 07:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,270,1486454400"; d="scan'208";a="68543590"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2017 07:24:12 -0700
Message-ID: <1491229948.17259.76.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Konopelko, Pavel (P.)" <pkonopel@visteon.com>
Date: Mon, 03 Apr 2017 09:32:28 -0500
In-Reply-To: <VI1PR0601MB2045F8FE2BE3944C67D1346AC5370@VI1PR0601MB2045.eurprd06.prod.outlook.com>
References: <VI1PR0601MB204589915BEAFCD77E7F9E42C5340@VI1PR0601MB2045.eurprd06.prod.outlook.com>
	<7752ad18-af62-78ed-2795-931aff3ce186@balister.org>
	<VI1PR0601MB2045F8FE2BE3944C67D1346AC5370@VI1PR0601MB2045.eurprd06.prod.outlook.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Subscribing to openembedded-architecture list
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
X-List-Received-Date: Mon, 03 Apr 2017 14:24:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-03-31 at 08:34 +0000, Konopelko, Pavel (P.) wrote:
> Philip,
> 
> Philip Balister wrote on 2017-03-30:
> > You should be able to join. Did you get any messages at all?
> 
> No responses at all.  Neither for web interface nor for mail requests to openembedded-architecture-{request|join}.  The only time I've got a response was when I tried to send the question below to openembedded-architecture and the message bounced.
> 

In this case, file a bug at bugzilla.yoctoproject.org so the issue is
tracked.

Leo



> Regards,
> --Pavel Konopelko
> 
> > On 03/30/2017 06:32 AM, Konopelko, Pavel (P.) wrote:
> >> Hello everybody,
> >> 
> >> I wonder if openembedded-architecture list is closed, invitation-only
> > or something.  The OE wiki [1] does not mention any restrictions.
> > Nevertheless I seem to be unable to subscribe via the web interface or
> > via an e-mail request (tried several times over the last couple of
> > weeks).
> >> 
> >> What am I missing?
> >> 
> >> 
> >> Thanks,
> >> --Pavel Konopelko
> >> 
> >> [1] http://openembedded.org/wiki/Mailing_lists
> >> 
> >>
> 
> 



