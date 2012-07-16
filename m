Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SqnKQ-0006M1-42
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:35:18 +0200
Received: by vbbfr13 with SMTP id fr13so3590568vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=y8Qh/VkX2dBVzGRBFsAfVjKtda6tWvA+PM563zvA4+A=;
	b=oYkBee4CdMfn8lP224gjjSLl3PP9OHm/FXsJXCsR+yAS3pLdAbBLgRsZaOwRCtvl+F
	Hc60jxWbY11c55Da1QU8bFwaWhf8mpi0YAEDbpAqcGEdu1H5dmwaIs+XhS0Ej+uapjSN
	rUUAL8AY9Ryg/s7C9rMOHX3rV/MKec63RaKFxBwWsnBLPMHGggU/7NCY18kRCne+64dq
	Be/qaro3Dz1Iv3s/3r9hncfDjVNpXGqDK3TZZp6YjIaYAde/cCfbhlo280uOH52gS/So
	WcRFNmd5BRWue0P566K8BlhyhhQ3tnIbFqXAyA0kbRA08m3/rQIRc4qXqbeJ3Rt/SwDD
	56EA==
MIME-Version: 1.0
Received: by 10.220.215.66 with SMTP id hd2mr5474168vcb.55.1342452239197; Mon,
	16 Jul 2012 08:23:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Mon, 16 Jul 2012 08:23:59 -0700 (PDT)
In-Reply-To: <83093679-57B8-4B40-9AEE-DDF98E73B087@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
	<CAP9ODKrBnzOM7rfhRr5KC-L_EjuwZ73NkpHcyg1hiOxKXD+6Rg@mail.gmail.com>
	<E5F016E0-45BD-4F23-8B53-01E45EB25AFB@dominion.thruhere.net>
	<CAP9ODKo3gqTjcYwnZuNJ9yq6G_CYh54A8JtngBA78hyREURTqw@mail.gmail.com>
	<83093679-57B8-4B40-9AEE-DDF98E73B087@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 12:23:59 -0300
X-Google-Sender-Auth: VNDILwlEDWc_HGL2NGcu8DEfnMI
Message-ID: <CAP9ODKouC3=xNF7tJuXMyNpUaVb8bqSQxL6QohUy_6K-aNd-Gw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update to 2.0+git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 15:35:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 10:40 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> On Mon, Jul 16, 2012 at 10:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> From what I read, those are backports; so you can use Backport
>>>> [applied in version X.Y]
>>>
>>> No, they were pulled of the powertop mailinglist and git-am'ed :)
>>
>> So it is pending.
>
> If a response from the maintainer saying "rejected" means "pending", then yes.

So put Rejected.

It is important to track the status, idependently of which status is it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


