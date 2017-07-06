Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 37E7560190
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 06:36:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 23:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,315,1496127600"; d="scan'208";a="875340230"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jul 2017 23:36:49 -0700
Date: Thu, 6 Jul 2017 09:37:20 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170706063719.GA25059@mbabyjoh-desk.ger.corp.intel.com>
References: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
	<1499267003-20382-13-git-send-email-maxin.john@intel.com>
	<CAJTo0LaA_q-6p3+M6TSX980_2gKBDjeOSMB7kNE6xNM42B1jeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaA_q-6p3+M6TSX980_2gKBDjeOSMB7kNE6xNM42B1jeA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/12] libva: upgrade to 1.8.3
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
X-List-Received-Date: Thu, 06 Jul 2017 06:36:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Wed, Jul 05, 2017 at 04:41:58PM +0100, Burton, Ross wrote:
>> 
>>DEPENDS_${PN} =+ "${PN}-utils"
>>
>
>Whilst this makes sense from a compatibility sense, I like that the
>binaries are no longer packaged with the libraries so I don't think we
>should have this dependency.
>
Ok, will update and send it as a single patch.

>Ross
 
Best Regards,
Maxin

