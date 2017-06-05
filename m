Return-Path: <andrej.valek@siemens.com>
Received: from gecko.sbs.de (unknown [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 35DBC60119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:37:46 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v55Bbcvo008349
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 5 Jun 2017 13:37:38 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v55BbbH3031591
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Jun 2017 13:37:38 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <1496235309-30694-1-git-send-email-andrej.valek@siemens.com>
	<b326ca76-61c3-d11a-c497-5e773e590815@siemens.com>
	<CAJTo0LbQR=NCQ9QyAY+R5QZTGFxiAx610s_GsaeZzvzUhSBwuA@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <a0b6fc52-f3ed-2b8a-7338-6b954f05a63b@siemens.com>
Date: Mon, 5 Jun 2017 13:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbQR=NCQ9QyAY+R5QZTGFxiAx610s_GsaeZzvzUhSBwuA@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] srecord: add collection of tools for manipulating EPROM load files
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
X-List-Received-Date: Mon, 05 Jun 2017 11:37:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

ok, I have moved it into meta-oe
(http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113040.html)

*fixed url

On 06/05/2017 12:42 PM, Burton, Ross wrote:
> 
> On 5 June 2017 at 08:55, Andrej Valek <andrej.valek@siemens.com 
> <mailto:andrej.valek@siemens.com>> wrote:
> 
>     For explanation, this utility is used for EPROM data manipulation.
>     I think, it should be useful for development of embedded devices.
> 
>     Is this the correct mailing list?
>     If not, which mailing list would be appropriate?
> 
> 
> I'd suggest that meta-oe would be a better place as this doesn't appear to be 
> universal enough for oe-core.
> 
> Ross
> 

