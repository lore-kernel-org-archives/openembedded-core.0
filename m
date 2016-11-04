Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 313DD71A23
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 08:04:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161104080402594_0485;
	Fri, 04 Nov 2016 08:04:02 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=41041 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c2ZTd-00087p-L2; Fri, 04 Nov 2016 04:03:53 -0400
Date: Fri, 4 Nov 2016 04:02:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <d1522ddb-4dd2-5f1c-5dc6-558ff6aefd75@mlbassoc.com>
Message-ID: <alpine.LFD.2.20.1611040402190.12985@ca624034.mitel.com>
References: <d1522ddb-4dd2-5f1c-5dc6-558ff6aefd75@mlbassoc.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: uninative binary?
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
X-List-Received-Date: Fri, 04 Nov 2016 08:04:05 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Nov 2016, Gary Thomas wrote:

> Some of my customers need to be able to build without any
> network connectivity, so I normally use BB_NO_NETWORK="1"
>
> Is there a way to add the uninative "binary shim" to my
> download mirror?  Given that the path includes a hash as
> a directory, it's not clear to me how to put it into my
> mirror.

  weirdly, i was about to ask the very same question ... you should
have waited. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


