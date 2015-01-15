Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 924327226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 14:57:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jan 2015 06:56:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,404,1418112000"; d="scan'208";a="662363801"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.151])
	([10.219.4.151])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2015 06:56:54 -0800
Message-ID: <54B7D574.9030606@linux.intel.com>
Date: Thu, 15 Jan 2015 08:57:56 -0600
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Dan McGregor <danismostlikely@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CACS+7ZQe+N6mWE8uPR2nmE8dcEtFjmzH8NfGfX_iVVgsp8y6eQ@mail.gmail.com>
In-Reply-To: <CACS+7ZQe+N6mWE8uPR2nmE8dcEtFjmzH8NfGfX_iVVgsp8y6eQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dpkg: fix host contamination
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
X-List-Received-Date: Thu, 15 Jan 2015 14:57:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

Can you explain in the commit message what is this change needed?

On 14/01/15 21:51, Dan McGregor wrote:
> +EXTRA_OECONF_append_class-target = " TAR=tar"

Kind regards

     alimon

