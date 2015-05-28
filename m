Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id 556E07568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 10:15:16 +0000 (UTC)
Received: from [192.168.2.34] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Yxupc-0003Vu-Tb
	for openembedded-core@lists.openembedded.org;
	Thu, 28 May 2015 12:14:33 +0200
Message-ID: <5566EA64.5080600@kernelconcepts.de>
Date: Thu, 28 May 2015 12:13:56 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>	<CAJTo0LbOKfUpUyor7AczZyffp7gQruYy3hYMqz+ewGxZzRc+mQ@mail.gmail.com>	<555C896A.8020107@kernelconcepts.de>	<CAP9ODKo7H5T3Thb+1SW9hGwkzxEbTzYJr2=fLraqje67ssHRpw@mail.gmail.com>	<555C8BAC.7090603@kernelconcepts.de>	<CAJTo0LYM_V=Ee5hzfhvK0OW224yZ7+TG+6iuQkk5WKxYHmJQeQ@mail.gmail.com>
	<555C90A4.3000407@kernelconcepts.de>
In-Reply-To: <555C90A4.3000407@kernelconcepts.de>
Subject: Re: [PATCH] gtk-engines: Allow gtk-engines package to be empty in order to make the -dev package installable.
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
X-List-Received-Date: Thu, 28 May 2015 10:15:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi,

On 20.05.2015 15:48, Florian Boor wrote:
> ok great... then I'll change it to dropping the dependency of the -dev package
> while I'm working on it anyway.

hrm strange... somehow my new patch did not make it to the list. Anyone an idea
if it ended up in some filter?

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

