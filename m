Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D9B4271A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 09:26:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Mar 2018 02:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,364,1517904000"; d="scan'208";a="45320368"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2018 02:26:52 -0700
To: akuster808 <akuster808@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2399974f-8b3a-66ee-5884-969cee6dda20@linux.intel.com>
Date: Mon, 26 Mar 2018 12:20:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
Subject: Re: Bind update
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
X-List-Received-Date: Mon, 26 Mar 2018 09:26:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/24/2018 05:35 PM, akuster808 wrote:
> While working on updating the current bind to the next patch level, I
> noticed our current version 9.10.6 will EOL June 2018. I know we are
> under feature freeze for the Sumo release.
> 
> Could we make an exception and allow an update of bind to the ESV
> version 9.11.3 ?, it EOL's Dec 2021.

I'd say yes. But please do send the updates for your packages in a 
timely manner.

Alex

