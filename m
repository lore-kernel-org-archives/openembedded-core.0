Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 9E79B72F7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:02:36 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170322110223095_0486;
	Wed, 22 Mar 2017 11:02:23 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=39689 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cqe1w-000407-81; Wed, 22 Mar 2017 07:02:16 -0400
Date: Wed, 22 Mar 2017 07:02:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbY4m=t5wzMnoOJxd0EuA+mVai6kovk7YRfZYPT_ymnLw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1703220701350.15389@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703220648410.15178@uk63952.mitel.com>
	<CAJTo0LbY4m=t5wzMnoOJxd0EuA+mVai6kovk7YRfZYPT_ymnLw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: possible content for site.conf?
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
X-List-Received-Date: Wed, 22 Mar 2017 11:02:38 -0000
Content-Type: multipart/mixed;
	BOUNDARY="587868445-1726539419-1490180536=:15389"

--587868445-1726539419-1490180536=:15389
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Mar 2017, Burton, Ross wrote:

>
> On 22 March 2017 at 10:51, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         from site.conf.sample, the obvious content is things like:
>
>       * download dir
>       * reference to local (in-house) source mirror
>       * http proxies/fetching configuration
>
>       and so on. any other things people throw into site.conf i can just add
>       to a list so readers can understand what that file is truly designed
>       for?
>
>
> That's pretty much the expected use.

  i thought so ... i wracked my brain trying to think what else
belonged in there, and that's all i came up with. thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-1726539419-1490180536=:15389--
