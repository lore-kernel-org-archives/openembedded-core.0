Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSM3f-0006Uk-HF
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 07:36:59 +0200
Received: by eaal1 with SMTP id l1so320820eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 22:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=93Y9J8M7j8VGo1silyQv/q8CB2w7aeJ4VVOF1EUptAU=;
	b=UBRzgOaXTgF6cZGGX/L/Fxiu8dRG/klTqsCd0uHLSfdO0EwrcEPProf1XbczOW2P3H
	smKKzq3s6jdIsNc7v2NGdjENlcUDxKBZDRZg+AjGpgBACwPPcxthmw1uhKHKi2IH4pPK
	w7Qg7/DUmm+OI1M33cGvLIeE8rQfwUaBuYkF2Uui0ocJT20J9i7U/hRmS639TKoUboIn
	hIXlUoElPm75sS8m/3bqT6jtdiGKWtWGg6DW2H9JvshGMp/SxohL2+2nyafBxgw5YKwA
	76V79Y0MWRk/ddH2JN4JOdfbyvN4xtJgU6BJAwVNz+unk6q3eNa+VGiIwOjW5oAkUULu
	cWLw==
Received: by 10.213.105.78 with SMTP id s14mr1131641ebo.84.1336627626086; Wed,
	09 May 2012 22:27:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 9 May 2012 22:26:35 -0700 (PDT)
In-Reply-To: <4FAA96FC.30707@balister.org>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
	<056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
	<CAF6bG8eTT0OPwLdJR1C=Acb+fx0oD4GLmRTwt5qX8Kq5m8Ckpg@mail.gmail.com>
	<4FAA96FC.30707@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2012 22:26:35 -0700
Message-ID: <CAMKF1srt72qJ=NiZayo_kPRVDOEb0KQKQH-2JTsG=Sctsw028g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
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
X-List-Received-Date: Thu, 10 May 2012 05:36:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 9, 2012 at 9:10 AM, Philip Balister <philip@balister.org> wrote:
>
> I guess I need to send my patch to oe-core I use to stop the locatoin
> being hardcoded by the script that comes with oe-core.

that will be nice.


