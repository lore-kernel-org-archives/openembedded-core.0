Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A86C67845A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 15:13:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jan 2018 07:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,381,1511856000"; d="scan'208";a="21071572"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2018 07:13:54 -0800
To: openembedded-core@lists.openembedded.org
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
	<CAJTo0LYJrDXkSG3zhEowg2UbFyYvoAPKKDUKoGd8qQ_yfBwCCA@mail.gmail.com>
	<CA+chaQczyj5GwNbcPrWsUAeyGv6Lo3MCaanRNpc5dj0BD96+nA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ced1db99-56e4-584e-775a-a345197a00bf@linux.intel.com>
Date: Fri, 19 Jan 2018 17:07:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQczyj5GwNbcPrWsUAeyGv6Lo3MCaanRNpc5dj0BD96+nA@mail.gmail.com>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Fri, 19 Jan 2018 15:13:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/19/2018 04:06 PM, Martin Jansa wrote:
> qemuarm, qemux86, raspberrypi3 and few more arm MACHINEs.

I just tried with qemux86 - builds fine, and the g-i files are present 
in the packages.

Alex

