Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UIJrP-0003G4-6w
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 15:19:27 +0100
Received: by mail-oa0-f47.google.com with SMTP id o17so1764574oag.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=TeVUFbnvS+8qpaCrvR3mUVEZUCjRFk68v8ywuZlFsu8=;
	b=ByQ2m8+pKd8TRDHJ2YueQyuzOIUY9nOI/OLR0PxSxJ4EoYZFxvnr76LbPUui7djTp0
	OYQjImvz6dECjshm3TbQuBsXtVfPu8TO+2lEkRyNX95qBSZVwkoUBQgGABZkbEpo3cT/
	rl/aBDvQ84Nq/EHcBKwr5jNgGExrsBpkDZ7VAi5K7Wymhtb2jy7TFrV/l/6MtI9izGwD
	iYB4vRSoGtqIMgME5+CXwHx7EG5ONq4RdMz15tsg6nrOjpripaTHFVrplB5fyPY5jS1T
	rhEAS88HzSAFTuMimjkPE6IRdabCzoB6zo0D9iVJGgVzDh7kD6O0SMPqgBYDvtge4L3X
	PQmw==
MIME-Version: 1.0
X-Received: by 10.182.110.33 with SMTP id hx1mr4160085obb.32.1363788151698;
	Wed, 20 Mar 2013 07:02:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 20 Mar 2013 07:02:31 -0700 (PDT)
In-Reply-To: <CAP9ODKpnych3aiFtvZnLyNk-KvQ_ysMH8oHC=bgD1w6q5P=feQ@mail.gmail.com>
References: <1363724207-31476-1-git-send-email-mark.hatle@windriver.com>
	<CAP9ODKpnych3aiFtvZnLyNk-KvQ_ysMH8oHC=bgD1w6q5P=feQ@mail.gmail.com>
Date: Wed, 20 Mar 2013 11:02:31 -0300
X-Google-Sender-Auth: E7bk-AacoUBUP4Kkt7WTZj415n4
Message-ID: <CAP9ODKrmgqpoOYUGf6rgztDiQ0VsDms1EPKMC7hCF42o0+CzPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-multilib-example: Location of core-image-sato.bb changed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 14:19:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 20, 2013 at 11:02 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Mar 19, 2013 at 5:16 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>
> I'd expect it to go to skeleton?

Ignore! just noticed you did exactly that :-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


