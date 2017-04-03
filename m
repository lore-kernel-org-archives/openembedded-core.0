Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D30D77CE3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 20:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491251979; x=1522787979;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=it8yeeNn93ox0qwr+Pm5bXaJmmpGzn+nOQbDdXqmbcI=;
	b=pYWjY+O6PF9bKjv4sMyLbDR0ngtDzRePSNAw27Yie94nE+v16FvzYO4y
	JWtOrHH8IlUcMu3C4cS4GkCYLLDR/A==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2017 13:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="841374483"
Received: from stutuncx-mobl7.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.5])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 13:39:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 04 Apr 2017 08:39:32 +1200
Message-ID: <3052459.lMOo6nDaO8@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <VI1PR0601MB2045F8FE2BE3944C67D1346AC5370@VI1PR0601MB2045.eurprd06.prod.outlook.com>
References: <VI1PR0601MB204589915BEAFCD77E7F9E42C5340@VI1PR0601MB2045.eurprd06.prod.outlook.com>
	<7752ad18-af62-78ed-2795-931aff3ce186@balister.org>
	<VI1PR0601MB2045F8FE2BE3944C67D1346AC5370@VI1PR0601MB2045.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Cc: "Konopelko, Pavel \(P.\)" <pkonopel@visteon.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 03 Apr 2017 20:39:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Michael - can you see anything relating to Pavel's issues subscribing to the 
openembedded-architecture list?

Thanks,
Paul

On Friday, 31 March 2017 9:34:22 PM NZST Konopelko, Pavel (P.) wrote:
> Philip Balister wrote on 2017-03-30:
> > You should be able to join. Did you get any messages at all?
> 
> No responses at all.  Neither for web interface nor for mail requests to
> openembedded-architecture-{request|join}.  The only time I've got a
> response was when I tried to send the question below to
> openembedded-architecture and the message bounced.
> 
> Regards,
> --Pavel Konopelko
> 
> > On 03/30/2017 06:32 AM, Konopelko, Pavel (P.) wrote:
> >> Hello everybody,
> >> 
> >> I wonder if openembedded-architecture list is closed, invitation-only
> > 
> > or something.  The OE wiki [1] does not mention any restrictions.
> > Nevertheless I seem to be unable to subscribe via the web interface or
> > via an e-mail request (tried several times over the last couple of
> > weeks).
> > 
> >> What am I missing?
> >> 
> >> 
> >> Thanks,
> >> --Pavel Konopelko
> >> 
> >> [1] http://openembedded.org/wiki/Mailing_lists


-- 

Paul Eggleton
Intel Open Source Technology Centre

