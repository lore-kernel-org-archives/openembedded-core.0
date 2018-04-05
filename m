Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 3678674D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 13:08:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 06:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,411,1517904000"; d="scan'208";a="40916604"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2018 06:08:29 -0700
To: Rajath C S <rajathcs.1996@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <CAPGMVzHSCh1VU91Leev0BaZNbzg05U--61WEO1UgcL700_WkBA@mail.gmail.com>
	<CAPGMVzGsUSor8=tX5EWWmnhUw1G4rpia9SVpSu=eYHw7DXDghw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <236bdac4-6e55-777d-b808-dcd6375d5dbb@linux.intel.com>
Date: Thu, 5 Apr 2018 16:02:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAPGMVzGsUSor8=tX5EWWmnhUw1G4rpia9SVpSu=eYHw7DXDghw@mail.gmail.com>
Subject: Re: [meta-oe] qemu boot problem
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
X-List-Received-Date: Thu, 05 Apr 2018 13:08:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/05/2018 01:43 PM, Rajath C S wrote:
> as the error specifies about a specific recipe missing the license, i'd 
> like to know which recipe is that what is the pointer to defaultpkgname

You need to provide both the command you issue on the command line, and 
the full output that it prints.

Alex

