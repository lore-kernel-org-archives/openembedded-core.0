Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D03F27842A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 11:40:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 04:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,392,1498546800"; d="scan'208";a="1163946794"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga001.jf.intel.com with ESMTP; 18 Aug 2017 04:40:48 -0700
Date: Fri, 18 Aug 2017 14:42:39 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170818114238.GA36557@mbabyjoh-desk.ger.corp.intel.com>
References: <1502744948-29741-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<1503056092.32591.11.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1503056092.32591.11.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: upgrade to 7.55.1
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
X-List-Received-Date: Fri, 18 Aug 2017 11:40:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi RP,

On Fri, Aug 18, 2017 at 12:34:52PM +0100, Richard Purdie wrote:
> On Mon, 2017-08-14 at 23:09 +0200, Oleksandr Kravchuk wrote:
> > Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> > ---
> >  meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >  rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} (92%)
> 
> https://autobuilder.yocto.io/builders/nightly-x32/builds/409/steps/BuildImages/logs/stdio
>

This log shows curl version 7.55.0 instead of 7.55.1 

> Cheers,
> 
> Richard
>

Best Regards,
Maxin

