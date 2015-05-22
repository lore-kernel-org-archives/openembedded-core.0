Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx6-out14.antispamcloud.com (mx6-out14.antispamcloud.com
	[95.211.2.226])
	by mail.openembedded.org (Postfix) with ESMTP id D29C8606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 10:23:30 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Yvk6q-0003sj-Ju; Fri, 22 May 2015 12:23:26 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 22 May 2015 12:23:50 +0200
Message-ID: <555F0396.9050301@topic.nl>
Date: Fri, 22 May 2015 12:23:18 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <555ED05A.6050102@topic.nl>
	<1755674.4xNgi4jax3@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1755674.4xNgi4jax3@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw2qn2YSnBaxCIAHbc091Tc1/63A71K+jqMokMNyfk/ad6zUhnDUpwAEsjGnc8y38ChhW
	DHFYc6XC0Haiqey5b0Mem3nkaZsJp+9zNJIzCkmTGjg7qdyjmJyrgO6VGJaEBWYMAlP/S0uOZZ5u
	SV0IozCkULD3D9o2ji4xTpO1ZTT2vqc9829axIrTVK9o3d/PSFJdZokGpJN4kYetzRzRnHsSFXzM
	m2XTvQmNQH/oH4XzXPWlFdaGOH191uXjgjQN/WMl8f7UBJCwFHD1l+nJkT+2UgOabFU9NyJNofKB
	ZZD+xeXoXPNrvHANfwuozbVTkyTO15OucnIuY/sU0a+x4GQodjbmNMe6/QVY6xYzI88a7VYlOo4O
	CtdHJmaiqBKojaJlSA7Ev4rQ3Oi9uJM0mPGCO5lJSNbvfxvjeYwTRdFTRyoeTCToQ4vh4+dF2R+A
	So9nm9RCE2jP7GbfNEvsB8mqC77XzkoQxgRbGiq02d7WFCbM4KUuNWr4taaUSZPgc/Ld14/y82eb
	PziYNS9mrGfA08GKnM0yMKbSH84z50uV5cnAvgrYcRjzbQGecw7Yt4PAgTtUp75uqlx0KezvZHU1
	UoV292D/suXw3wufSdnrzHkfATGQrLEsGz/Salrk+OidX4Ts4xdG+C13IyWeZaLUK63NTxKilQsp
	qDdGN4Ln+A5CAbD8n0gD8pG7zUI5+V5oWjmYZ1NRn5HvsGB+KIyQDf8/PGjzz3yA6N7Vy/TN
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJXhXyDRoOQM5J3kcUr0HrMvJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: "packagegroup-core-qt4e" broken?
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
X-List-Received-Date: Fri, 22 May 2015 10:23:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 22-05-15 10:38, Paul Eggleton wrote:
> Hi Mike,
>
> On Friday 22 May 2015 08:44:42 Mike Looijmans wrote:
>> When building (just for having something on my display) "qt4e-demo-image=
",
>> it bailed out with the following error:
>>
>>    * satisfy_dependencies_for: Cannot satisfy the following dependencies=
 for
>> packagegroup-core-qt4e:
>>    * 	qt4-embedded-plugin-phonon-backend-gstreamer *
>>    * opkg_install_cmd: Cannot install package packagegroup-core-qt4e.
>>
>> I guess this is related to all the gstreamer changes lately?
>
> I've just sent a fix for this, thanks for the report.
>
> Cheers,
> Paul
>

Strange thing was, after just manually removing that package line from the=
=20
packagegroup-core-qt4e recipe, do_rootfs kept failing with a checksum misma=
tch=20
on that package. I tried cleansstate and manually removing all traces of th=
e=20
recipe, but that didn't help, it would rebuild the ipk and then still fail =
on=20
the checksum. Only removing 'tmp' finally got rid of this failure.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






