Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E6B43600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 08:38:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2018 01:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,313,1517904000"; d="scan'208";a="25009923"
Received: from peggleto-mobl.ger.corp.intel.com ([172.30.199.135])
	by fmsmga008.fm.intel.com with ESMTP; 16 Mar 2018 01:38:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 16:38:21 +0800
Message-ID: <2253094.HcR9a229KH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <6568ecb5-4bc4-57d1-34fc-3ac8a9e7b723@intel.com>
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
	<e2eba80b-88ff-1d6c-3d30-29542f58be38@windriver.com>
	<6568ecb5-4bc4-57d1-34fc-3ac8a9e7b723@intel.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: Re: [PATCH] kernel.bbclass: set HOSTLDFLAGS in KCONFIG_CONFIG_COMMAND
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
X-List-Received-Date: Fri, 16 Mar 2018 08:38:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Actually it's an artifact of how mailman works, it excludes CC on the mail to 
the list - I'm not sure whether were it to include it that the message would 
end up being CC'd both from the act of you sending the message and the mailing 
list also sending its copy, but as far as I have observed it has always 
behaved this way. It's possible that the "avoid duplicate messages" user 
preference setting has an effect, not sure.

Cheers,
Paul

On Friday, 16 March 2018 4:47:14 AM +08 Cal Sullivan wrote:
> Yeah I'm confused. My outbox says Ross is CC'd, my inbox does not. My 
> mail client is borked somehow.
> 
> ---
> Cal
> 
> On 03/15/2018 01:30 PM, Randy MacLeod wrote:
> > On 2018-03-15 03:53 PM, Cal Sullivan wrote:
> >> Woops, +Ross to CC.
> > Maybe you used BCC? Anyway +Ross to CC for reals now. :)
> > ../Randy

-- 

Paul Eggleton
Intel Open Source Technology Centre



