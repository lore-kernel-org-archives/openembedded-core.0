Received: from mail-bk0-f54.google.com ([209.85.214.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UQDhe-000663-Vy
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 11:22:00 +0200
Received: by mail-bk0-f54.google.com with SMTP id q16so695586bkw.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RNrH8kKZ51YH2xzAmutq1G6Kc7qwFNgK5ay1vCXcSXk=;
	b=xVGJLlhvf20Pu7R9alWCMxRB23pWmfV1esWrJOi3Y/CZQjfP6e4SsfLqDB0VBUp6C3
	dHJld9udvBtHHRdzIT8LRm2gwC7CdnZfgrEtzFptFLagtk5W+NZKW6Bd8502jebwS/Hq
	UU9Ai/T9fxz4SpHs12eTvoeRX7uxexQyOz8rM7T5RngMto/wbqN0NkU8Wc9jmRXUwyzL
	6INTR2r8INpR3gDWYlcITaFLQRmhmrVLtwr68Cee7qzSRPg/VrL1OVx0oy+FXjlQteEr
	PUGap/t6r/xU2GGccw7SqhGnKiDfnc8iwubTW11YXaHO/PsNLrdR7zMjmFqInLK+Qx2o
	WA0w==
X-Received: by 10.204.167.73 with SMTP id p9mr2065123bky.99.1365671076259;
	Thu, 11 Apr 2013 02:04:36 -0700 (PDT)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id jt9sm1368730bkb.18.2013.04.11.02.04.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 02:04:35 -0700 (PDT)
Message-ID: <51667CA1.8050003@gmail.com>
Date: Thu, 11 Apr 2013 11:04:33 +0200
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
	<929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
	<CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
	<5165AB03.8020404@gmail.com>
	<CAHUNapQJ0qWxW7KZuUTvVhd62=nx4Y8GEdi30c-WHv+Te01rPw@mail.gmail.com>
	<20130410225352.GA28466@denix.org>
In-Reply-To: <20130410225352.GA28466@denix.org>
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 09:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/04/2013 00:53, Denys Dmytriyenko ha scritto:
> On Wed, Apr 10, 2013 at 06:44:21PM -0400, Trevor Woerner wrote:
>> On Wed, Apr 10, 2013 at 2:10 PM, Marco <koansoftware@gmail.com> wrote:
>>> Yes, it is copied from meta-openembedded into oe-core
>>
>> I'm sorry, I thought the [meta-oe] in the subject line implied this
>> patch was destined for meta-openembedded, not coming from
>> meta-openembedded.
>
> Agree.
>


[meta-oe] was my fauly, I already sent my apologies in IRC yesterday :-(
Sorry

-- 
Marco


